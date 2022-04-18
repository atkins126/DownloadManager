unit DomainConsts;

interface

const
  cDownloadStarted = 'Download iniciado';
  cDownloadAborted = 'Download abortado pelo usu�rio';
  cFileSaved = 'Arquivo salvo em "%s"';
  cLogCreate = 'Log do download salvo com sucesso';

  cDownloaderIsNotDownloading = 'Erro interno: O downloader n�o est� realizando um download.';
  cDownloaderIsBusy = 'Erro interno: O downloader est� ocupado. Tente novamente mais tarde.';
  cUrlIsEmpty = 'Erro interno: O par�metro "URL" est� vazio.';
  cResponseHeaderDoesNotContainsContentField = 'Erro interno: O cabe�alho da resposta HTTP n�o possui o campo "Content-Disposition".';
  cContentDisposition = 'Content-Disposition';
  cNetHTTPRequestIsNull = 'O par�metro ANetHTTPRequestIsNull n�o pode ser nulo.';
  cDownloadCompleted = 'Download conclu�do com sucesso!';

  cInvalidContentDispositionTypeMessage = 'Erro interno: Valor inv�lido para o par�metro AContentDisposition.';

  cDirectoryDoesntExists = 'Erro interno: The destination directory (%s) doesn''t exists.';
  cFileAlreadyExists  = 'Erro interno: The file (%s) already exists.';
  cFileDoesntExists  = 'Erro interno: The file (%s) doesn''t exists.';
  cFileNameIsEmpty  = 'Erro interno: The file name is empty.';
  cDirectoryPathIsEmpty  = 'Erro interno: The directory name is empty.';

implementation

end.
