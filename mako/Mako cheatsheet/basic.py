from mako.template import Template

mytemplate = Template(filename="basic.in")
print(mytemplate.render(x=100))
