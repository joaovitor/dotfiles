# you can use this function like this:
# for i in `find app -name '*.erb'`; do erb2haml $i; done

erb2haml(){
  erb_file=$1
  haml_file=${erb_file/erb/haml}
  html2haml $erb_file > $haml_file
  git rm $erb_file
  git add $haml_file
  git ci -m "$erb_file hamlized"
  echo $erb_file converted to $haml_file
}