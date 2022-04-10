unit FileManager;

interface

uses System.Classes, System.SysUtils;

const
  cDirectoryDoesntExists = 'Internal error: The destination directory (%s) doesn''t exists.';
  cFileAlreadyExists  = 'Internal error: The destination file name already exists.';
  cFileNameIsEmpty  = 'Internal error: The file name is empty.';
  cDirectoryPathIsEmpty  = 'Internal error: The directory name is empty.';

type
  ///<summary>Offers some tools to help with file management.</summary>
  TFileManager = class
  private
    procedure CheckDirectory(ADestDirectory: String; AForceDirectory: Boolean);
    procedure CheckFile(ACompleteFileName: String; AFileCanBeOverwritten: Boolean);
    function BuildCompleteFileName(ADirectoryPath: String; AFileName: String): String;
  public
    procedure SaveFile(ASourceStream: TStream; ADestDirectory: String; ADestFile: String; AForceDirectory: Boolean = False; AOverwriteExistentFile: Boolean = False);
  end;

implementation

{ TFileManager }

/// <summary>Create a file on disk based on stream object.</summary>
/// <param name="ASourceStream">A stream object that has the source data</param>
/// <param name="ADestFolder">Name of the directory where the file will be saved.</param>
/// <param name="ADestFile">Used to name the file that will be created.</param>
/// <remarks>
/// If the parameter "ADestFolder" doesn't exist on the disk or the parameter "ADestFile" is empty, an exception is raised.
/// </remarks>
function TFileManager.BuildCompleteFileName(ADirectoryPath, AFileName: String): String;
begin
  if ADirectoryPath.IsEmpty() then
    raise Exception.Create(cDirectoryPathIsEmpty);

  if AFileName.IsEmpty() then
    raise Exception.Create(cFileNameIsEmpty);

  Result := IncludeTrailingPathDelimiter(ADirectoryPath) + AFileName;
end;

/// <summary>This auxiliary method just checks if a directory exists and creates it in case the AForceDirectory parameter is true. Otherwise, throws an exception.</summary>
/// <param name="ADestDirectory">The complete directory path you want to check.</param>
/// <param name="AForceDirectory">If it's true, indicates the directory must be created (if it doesn't exist). If it's false, indicates an exception must be thrown if the directory doesn't exist.</param>
/// <remarks>If the parameter "ADestDirectory" doesn't exist on the disk and AForceDirectory is false, an exception is raised.</remarks>
procedure TFileManager.CheckDirectory(ADestDirectory: String; AForceDirectory: Boolean);
begin
  if AForceDirectory then ForceDirectories(ADestDirectory);

  if not DirectoryExists(ADestDirectory) then
    raise Exception.Create(Format(cDirectoryDoesntExists, [ADestDirectory]));
end;

/// <summary>This auxiliary method just checks if a file exists. If the file already exists and the argument AFileCanBeOverwritten is false, then an exception is thrown.</summary>
/// <param name="ACompleteFileName">The complete fire name you want to check.</param>
/// <param name="AFileCanBeOverwritten">If this parameter is true, an exception will be raised in case the file already exists. Otherwise, nothing is done.</param>
/// <remarks>If the parameter "AFileCanBeOverwritten" is false and the file already exists, an exception is thrown.</remarks>
procedure TFileManager.CheckFile(ACompleteFileName: String; AFileCanBeOverwritten: Boolean);
begin
  if FileExists(ACompleteFileName) and (not AFileCanBeOverwritten) then
    raise Exception.Create(cFileAlreadyExists);
end;

/// <summary>It checks if the directory already exists. After that, it saves the content of ASourceStream into a file.</summary>
/// <param name="ASourceStream">A stream that contains the data you want to save into the file.</param>
/// <param name="ADestDirectory">The directory path where you want to save your file. If AForceDirectory is true, the directory will be created in case it doesn't exist.</param>
/// <param name="ADestFile">The name (with extension) of the new file. If the file already exists and AOverwriteExistentFile is false, an exception is thrown.</param>
/// <param name="AForceDirectory">Indicates if the directory should be created in case it doesn't exist.</param>
/// <param name="AOverwriteExistentFilet">Indicates if the file should be overwritten in case it already exists.</param>
/// <remarks>
/// An exception will be thrown in the following cases:
/// - ADestDirectory is empty
/// - ADestFile is empty
/// - ADestDirectory doesn't exist and AForceDirectory is false
/// - ADestFile already exists and AOverwriteExistentFile is false
/// </remarks>
procedure TFileManager.SaveFile(ASourceStream: TStream; ADestDirectory: String; ADestFile: String; AForceDirectory: Boolean = False; AOverwriteExistentFile: Boolean = False);
var
  lFileStream: TFileStream;
  lCompleteFileName: String;
begin
  lCompleteFileName := BuildCompleteFileName(ADestDirectory, ADestFile);

  CheckDirectory(ADestDirectory, AForceDirectory);

  CheckFile(lCompleteFileName, AOverwriteExistentFile);

  lFileStream := TFileStream.Create(lCompleteFileName, fmCreate);
  try
    lFileStream.CopyFrom(ASourceStream);
  finally
    lFileStream.Free;
  end;
end;

end.
