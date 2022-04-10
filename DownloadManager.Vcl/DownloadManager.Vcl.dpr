program DownloadManager.Vcl;

uses
  Vcl.Forms,
  Observer in 'Source\Infra\Observer\Observer.pas',
  Subject in 'Source\Infra\Observer\Subject.pas',
  ContentDispositionHelper in 'Source\Domain\ContentDispositionHelper.pas',
  Constants in 'Source\Infra\Constants.pas',
  FileManager in 'Source\Domain\FileManager.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Run;
end.
