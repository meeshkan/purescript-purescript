import json
import sys
f = sys.argv[1]

def simplify(j):
  if type(j) == type({}):
    o = {**j}
    o.pop('annotation', None)
    o.pop('sourceSpan', None)
    o.pop('meta', None)
    return {k:simplify(v) for k,v in o.items() }
  elif type(j) == type([]):
    return [simplify(x) for x in j]
  else:
    return j

if __name__ == '__main__':
  with open(f, 'r') as j:
    print(json.dumps(simplify(json.loads(j.read())), indent=2))