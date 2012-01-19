@echo off

setlocal

set mkl_lib=C:\algomakebuilds\tools\SourcePro\IntelMKL-9.1\win32-x86_64-6.1\bin
set ase_lib=c:\algomakebuilds\build\ship\win32-x86_64-6.1\lib
set genlib_lib=C:\Algorithmics\GenLib-4.7.0\makefiles\WinBuild\x64\Debug_dll_mt
set genlib_target=C:\algomakebuilds\tools\GenLib-4.7.0\0413\win32-x86_64-6.1-gl-mt-debug-noopt-rwdebug\lib
set algocxx_target=C:\algomakebuilds\tools\AlgoCxx-4.7.0\0109\win32-x86_64-6.1-noopt-debug\lib

copy %mkl_lib%\*.dll %ASE_LIB%
copy %ALGOCXX_LIB%\*.dll %ASE_LIB%
copy %genlib_lib%\*.dll %ASE_LIB%

copy %genlib_lib%\GenLib_d_mt.lib %genlib_target%\GenLib_r.lib
copy %algocxx_lib%\*.lib %algocxx_target%\
copy %algocxx_lib%\algoadsD.lib %algocxx_target%\algoads.lib
copy %algocxx_lib%\algobaseD.lib %algocxx_target%\algobase.lib
copy %algocxx_lib%\algocfgD.lib %algocxx_target%\algocfg.lib
copy %algocxx_lib%\algoeventdispatcherD.lib %algocxx_target%\algoeventdispatcher.lib
copy %algocxx_lib%\algoioD.lib %algocxx_target%\algoio.lib
copy %algocxx_lib%\algolicenseD.lib %algocxx_target%\algolicense.lib
copy %algocxx_lib%\algologD.lib %algocxx_target%\algolog.lib
copy %algocxx_lib%\algolookupD.lib %algocxx_target%\algolookup.lib
copy %algocxx_lib%\algonetD.lib %algocxx_target%\algonet.lib
copy %algocxx_lib%\algooptsD.lib %algocxx_target%\algoopts.lib
copy %algocxx_lib%\algoplatformD.lib %algocxx_target%\algoplatform.lib
copy %algocxx_lib%\algosecurityD.lib %algocxx_target%\algosecurity.lib
copy %algocxx_lib%\algosoapliteD.lib %algocxx_target%\algosoaplite.lib
copy %algocxx_lib%\algothropsD.lib %algocxx_target%\algothrops.lib
copy %algocxx_lib%\algothrpoolD.lib %algocxx_target%\algothrpool.lib
copy %algocxx_lib%\algothrutilD.lib %algocxx_target%\algothrutil.lib
copy %algocxx_lib%\algotraceD.lib %algocxx_target%\algotrace.lib
copy %algocxx_lib%\algoxercesD.lib %algocxx_target%\algoxerces.lib
copy %algocxx_lib%\algoxmlD.lib %algocxx_target%\algoxml.lib
copy %algocxx_lib%\algoxmliteD.lib %algocxx_target%\algoxmlite.lib
copy %algocxx_lib%\algozlibD.lib %algocxx_target%\algozlib.lib

endlocal
