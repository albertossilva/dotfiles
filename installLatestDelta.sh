version=$(curl -s https://api.github.com/repos/dandavison/delta/releases/latest \
	| grep "tag_name" \
	| awk '{print substr($2, 2, length($2) - 3)}')

file_name="delta-$version-x86_64-apple-darwin"
location="https://github.com/dandavison/delta/releases/download/$version/$file_name.tar.gz"

curl -LO $location

tar xzf "$file_name.tar.gz"
rm "$file_name.tar.gz"
rm -f /usr/local/bin/delta
mv $file_name/delta /usr/local/bin
rm -rf $file_name
