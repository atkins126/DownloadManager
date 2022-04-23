unit DomainConsts;

interface

const
  {$region 'messages'}
  cDownloadStarted = 'Download iniciado';
  cDownloadAborted = 'Download abortado pelo usu�rio';
  cFileSaved = 'Arquivo salvo em "%s"';
  cLogCreate = 'Log do download salvo com sucesso';
  cDownloaderIsNotDownloading = 'Erro interno: O downloader n�o est� realizando um download.';
  cDownloaderIsBusy = 'Erro interno: O downloader est� ocupado. Tente novamente mais tarde.';
  cUrlIsEmpty = 'Erro interno: O par�metro "URL" est� vazio.';
  cContentDisposition = 'Content-Disposition';
  cNetHTTPRequestIsNull = 'O par�metro ANetHTTPRequestIsNull n�o pode ser nulo.';
  cDownloadCompleted = 'Download conclu�do com sucesso!';
  cDirectoryDoesntExists = 'Erro interno: O diret�rio de destino (%s) n�o existe.';
  cFileAlreadyExists  = 'Erro interno: O arquivo (%s) j� existe.';
  cFileDoesntExists  = 'Erro interno: O arquivo (%s) n�o existe.';
  cFileNameIsEmpty  = 'Erro interno: O nome do arquivo est� vazio.';
  cDirectoryPathIsEmpty  = 'Erro interno: O nome do diret�rio est� vazio.';
  {$endregion}

implementation

end.
