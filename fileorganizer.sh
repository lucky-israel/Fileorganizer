# Create dir for each file type if they don't exist
 mkdir -p images documents others
 echo "dir created into images/, documents/, others/"

 # Loop through files in the current directory
 for file in *; do
     # skip dir and the script itself
     if [[ -f $file && $file != "organize_files.sh" ]]; then
         case "${file##*.}" in
              jpg|png|jpeg)
                 mv "$file" images/
                 echo "$(date): Moved $file to images/" >> organize.log
                 ;;
               pdf|doc|docx|txt)
                   mv "$file" documents/
                   echo "$(date): Moved $file to documents/" >> organize.log
                   ;;
                *)
                   mv "$file" others/
                   echo "$(date): Moved $file to others/" >> organize.log
         esac
    fi
 done

echo "files organized into folders! Log saved in  organize.log"
