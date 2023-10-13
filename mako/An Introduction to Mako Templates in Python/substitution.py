from mako.template import Template
tmp = Template(filename='substitution.in')
print(tmp.render(headline="News 24/7")) 
