import json
import sys

file_paths = sys.argv[1:]

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
  for file_path in file_paths:
    file = open(file_path, 'r')
    file_contents = file.read()
    file.close()

    file = open(file_path, 'w')
    file.write(json.dumps(simplify(json.loads(file_contents)), indent=2))

    file.close()
