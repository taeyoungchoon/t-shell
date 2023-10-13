from mako.template import Template

tmp = Template(filename='control.in')
#tmp = Template("hello, ${name}")
print(tmp.render(credit=["You", "Me", "Us", "Them"]))
#print(tmp.render(name="jack"))
