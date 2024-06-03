#!/usr/bin/env bash

# Use environment variable or default value
SRVPORT="${SRVPORT:-4499}"
RSPFILE=response

# Remove the response file if it exists and create a named pipe
rm -f $RSPFILE
mkfifo $RSPFILE

# Function to get the API request
get_api() {
    read line
    echo $line
}

# Function to handle incoming requests
handleRequest() {
    # Process the request
    get_api
    mod=$(fortune)

    cat <<EOF > $RSPFILE
HTTP/1.1 200 OK

<pre>$(cowsay $mod)</pre>
EOF
}

# Function to check prerequisites
prerequisites() {
    echo "Checking prerequisites..."
    command -v cowsay >/dev/null 2>&1 || { echo "cowsay not installed"; exit 1; }
    command -v fortune >/dev/null 2>&1 || { echo "fortune not installed"; exit 1; }
    echo "All prerequisites are installed."
}

# Main function to start the server
main() {
    prerequisites
    echo "Wisdom served on port=$SRVPORT..."

    while true; do
        cat $RSPFILE | nc -lN $SRVPORT | handleRequest
        sleep 0.01
    done
}

# Run the main function
main
