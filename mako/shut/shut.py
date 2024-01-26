from mako.template import Template

tmp = Template(filename='shut.tmpl')
print(tmp.render(intf=["en1","en2","en3"]))
