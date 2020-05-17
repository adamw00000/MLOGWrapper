Get-Content "./build.conf" | foreach-object -begin {$conf=@{}} -process { $k = [regex]::split($_,'='); if(($k[0].CompareTo("") -ne 0) -and ($k[0].StartsWith("[") -ne $True)) { $conf.Add($k[0], $k[1]) } }
$javaHome = Get-Variable JAVA_HOME -valueOnly

& $conf.SWIG_PATH -c++ -java ./cec20.i
& $conf.GPP_PATH -c -fpic main.cpp
& $conf.GPP_PATH -c -fpic cec20_test_func.cpp
& $conf.GPP_PATH -c -fpic cec20_wrap.cxx  -I"$($conf.JAVA_HOME)/include" -I"$($conf.JAVA_HOME)/include/win32"
& $conf.GPP_PATH -shared main.o cec20_wrap.o cec20_test_func.o -o libcec20.dll
& "$($conf.JAVA_HOME)/bin/javac" -cp . Main.java