from mako.template import Template

tmp = Template(filename='code.in')
#print(tmp.render(credit=["You", "Me", "Us", "Them"]))
#print(tmp.render(name="jack"))
print(tmp.render())
