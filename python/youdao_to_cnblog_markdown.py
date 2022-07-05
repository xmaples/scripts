import re

def youdao_to_cnblogs_markdown(*,input_str=None, input_file=None, output_file=None):
    """
    replace math expressions
    :param input_file:
    :param output_file:
    :return:
    """
    if not input_str and input_file:
        with open(input_file) as fp:
            input_str = fp.read()
    tmp = input_str
    tmp = re.sub(r'```math((?:(?!```).)*)```', r'$$\1$$', tmp, flags=re.DOTALL)
    tmp = re.sub(r'(?:(?!\n)\s)?`\$((?:(?<!\$`).)*)\$`(?:(?!\n)\s)?', r' $\1$ ', tmp)
    if output_file:
        with open(output_file, mode='w') as fp:
            fp.write(tmp)
    return tmp

if __name__ == '__main__':
    import argparse
    import sys
    arg_parser=argparse.ArgumentParser(description='convert markdown of youdao to of cnblogs (mainly math expressions)')
    arg_parser.add_argument('--input', nargs='?', type=argparse.FileType('r'), default=sys.stdin, help='input with youdao markdown format')
    arg_parser.add_argument('--output', nargs='?', type=argparse.FileType('w'), default=sys.stdout, help='output with cnblogs markdown format')
    args=arg_parser.parse_args()
    input_str=args.input.read()
    output_str=youdao_to_cnblogs_markdown(input_str=input_str)
    args.output.write(output_str)
