{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_myproj (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "F:\\server\\myproj\\.stack-work\\install\\95cf00af\\bin"
libdir     = "F:\\server\\myproj\\.stack-work\\install\\95cf00af\\lib\\x86_64-windows-ghc-8.6.5\\myproj-0.1.0.0-Fm2SI57gqfuDCiNZVFPFD2-myproj-exe"
dynlibdir  = "F:\\server\\myproj\\.stack-work\\install\\95cf00af\\lib\\x86_64-windows-ghc-8.6.5"
datadir    = "F:\\server\\myproj\\.stack-work\\install\\95cf00af\\share\\x86_64-windows-ghc-8.6.5\\myproj-0.1.0.0"
libexecdir = "F:\\server\\myproj\\.stack-work\\install\\95cf00af\\libexec\\x86_64-windows-ghc-8.6.5\\myproj-0.1.0.0"
sysconfdir = "F:\\server\\myproj\\.stack-work\\install\\95cf00af\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "myproj_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "myproj_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "myproj_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "myproj_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "myproj_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "myproj_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
