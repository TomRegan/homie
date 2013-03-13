# thanks to:  http://blog.blindgaenger.net/colorize_maven_output.html
# and: http://johannes.jakeapp.com/blog/category/fun-with-linux/200901/maven-colorized
# Colorize Maven Output
# alias maven="command mvn"
color_maven() {
  $* | LANG=C sed -e 's/Tests run: \([^,]*\), Failures: \([^,]*\), Errors: \([^,]*\), Skipped: \([^,]*\)/[1;32mTests run: \1[0m, Failures: [0;31m\2[0m, Errors: [0;33m\3[0m, Skipped: [0;34m\4[0m/g' \
    -e 's/\([^at]*\)\(at\ [A-Za-z]*\..*\)/\1[0;31m\2[0m/g' \
    -e 's/^\([A-Za-z]*\..*\)/[0;31m\1[0m/g' \
    -e 's/\(\[WARN\].*\)/[0;33m\1[0m/g' \
    -e 's/\(WARN.*\)/[0;33m\1[0m/g' \
    -e 's/\(\[ERROR\].*\)/[0;31m\1[0m/g' \
    -e 's/\(BUILD FAILURE.*\)/[0;31m\1[0m/g' \
    -e 's/\(FAILURE!.*\)/[0;31m\1[0m/g' \
    -e 's/\(BUILD SUCCESS.*\)/[0;37m\1[0m/g' \
    -e 's/\(SUCCESS.*\)/[0;37m\1[0m/g' 
}

alias mvn="color_maven mvn"
alias mvn2="color_maven /usr/local/bin/mvn"
