unit DesktopConsts;

interface

const
  {$region 'messages'}
  cEmptyUrlMessage = 'Eu preciso de uma URL para fazer o download.';
  cDownloaderIsBusyMessage = 'J� existe um download em andamento e eu n�o suporto downloads simult�neos (ainda). Aguarde um pouco, por favor.';
  cDownloaderCantStopNowMessage = 'N�o h� downloads em andamento no momento.';
  cDownloadInterruptConfirmationMessage = 'Existe um download em andamento. Se voc� me fechar, o download ser� interrompido. Quer realmente me fechar?';
  cDownloadProgressMessage = 'Progresso: %s';
  {$endregion}

  {$region 'SQL connection configuration'}
  cDriverUnit = 'DriverUnit=Data.DbxSqlite';
  cDriverPackageLoader = 'DriverPackageLoader=TDBXSqliteDriverLoader,DBXSqliteDriver280.bpl';
  cMetaDataPackageLoader = 'MetaDataPackageLoader=TDBXSqliteMetaDataCommandFactory,DbxSqliteDriver280.bpl';
  cFailIfMissing = 'FailIfMissing=True';
  cDatabase = 'Database=%s';
  {$endregion}

  {$region 'Others'}
  cDownloadDirectoryName = 'Download';
  cDatabaseFileExtension = '.db';
  cViewMessageButtonCaption = 'Ver mensagem';
  cLogText = '[%s] -> %s';
  cShellExecuteOperationOpen = 'open';
  cShellExecuteOperationParameter = '/select,';
  cWindowsExplorer = 'explorer.exe';
  cScrollBarWidth = 37;
  {$endregion}

implementation

end.
