git clone https://github.com/yoshiki/yaml-mode.git
cd yaml-mode
sudo mkdir -p /usr/local/share/emacs/site-lisp
sudo make
sudo make install

cat <<EOF >> ~/.emacs.d/init.el
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/")
(require 'yaml-mode)
EOF

echo ---
cat ~/.emacs.d/init.el
