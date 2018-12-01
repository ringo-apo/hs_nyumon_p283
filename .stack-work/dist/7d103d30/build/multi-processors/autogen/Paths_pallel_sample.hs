{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_pallel_sample (
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

bindir     = "C:\\data\\develop\\making\\Haskell\\hs_nyumon_p283\\pallel-sample\\.stack-work\\install\\ad603a72\\bin"
libdir     = "C:\\data\\develop\\making\\Haskell\\hs_nyumon_p283\\pallel-sample\\.stack-work\\install\\ad603a72\\lib\\x86_64-windows-ghc-8.4.4\\pallel-sample-0.1.0.0-ChLtTCHCTmcJC3A8TEh7SE-multi-processors"
dynlibdir  = "C:\\data\\develop\\making\\Haskell\\hs_nyumon_p283\\pallel-sample\\.stack-work\\install\\ad603a72\\lib\\x86_64-windows-ghc-8.4.4"
datadir    = "C:\\data\\develop\\making\\Haskell\\hs_nyumon_p283\\pallel-sample\\.stack-work\\install\\ad603a72\\share\\x86_64-windows-ghc-8.4.4\\pallel-sample-0.1.0.0"
libexecdir = "C:\\data\\develop\\making\\Haskell\\hs_nyumon_p283\\pallel-sample\\.stack-work\\install\\ad603a72\\libexec\\x86_64-windows-ghc-8.4.4\\pallel-sample-0.1.0.0"
sysconfdir = "C:\\data\\develop\\making\\Haskell\\hs_nyumon_p283\\pallel-sample\\.stack-work\\install\\ad603a72\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "pallel_sample_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "pallel_sample_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "pallel_sample_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "pallel_sample_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "pallel_sample_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "pallel_sample_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
