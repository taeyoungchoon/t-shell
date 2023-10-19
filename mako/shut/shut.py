from mako.template import Template

tmp = Template(filename='shut.tmpl')
#tmp = Template("hello, ${name}")
print(tmp.render(intf=["en1","en2","en3"]))
#print(tmp.render(name="jack"))
