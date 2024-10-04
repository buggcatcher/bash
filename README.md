custom commands

srcmd:  Interactive command search.

srcman:  Interactive manual page searcher.

path:    Copies current directory path to clipboard.

missing: Compares two directories for missing files.

ship:    Displays ASCII ship.


----
to add:

hi highlight <word> <file>
alias hi='grep --color=always -e "^" -e'


To split fortune and pokeget output into columns:

    column:             
    This command is a powerful way to format text data into columns.         
    You can use delimiters (like spaces or commas) to structure your text output.         
    For example, running column -s, -t filename.csv will align the contents of a CSV file into cleanly separated columns.         
    You can customize headers, align columns, or truncate long data using options like -N for column names or -T for truncation​(Mike F Robbins)​(Putorius).        

    awk:            
    If you need more control, awk combined with printf allows for formatted outputs with specific column widths.            
    For example, awk '{ printf "%-10s %-10s\n", $1, $2 }' file.txt will print the first two columns of a file, adjusting their widths to 10 characters.        

