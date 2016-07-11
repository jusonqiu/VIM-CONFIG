# !/bin/bash
find . -name "*.h" -o -name "*.c" -o -name "*.cpp" -o -name "*.m" -o -name "*.mm" -o -name "*.java" -o -name "*.py"  | tee  /tmp/src.files
ctags -RV --c++-kinds=+px --fields=+iaS --extra=+q -L /tmp/src.files
rm -f /tmp/src.files
echo "~done~"
cscope -Rbkq && echo "#2 done"

