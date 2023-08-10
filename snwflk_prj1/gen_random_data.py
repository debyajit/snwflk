# input file str 
#fieldname|datatype
#act_week|date


import csv
import random
from datetime import date

def generate_csv(input_file, output_file):
    with open(input_file, 'r') as f:
        reader = csv.reader(f, delimiter='|')
        fieldnames = [row[0] for row in reader]
        datatypes = [row[1] for row in reader]

    with open(output_file, 'w', newline='') as f:
        writer = csv.writer(f, delimiter='~', quoting=csv.QUOTE_ALL)
        writer.writerow(fieldnames)

        for _ in range(1000):
            row = []
            for datatype in datatypes:
                if datatype == 'date':
                    value = str(date.today())
                elif datatype == 'char':
                    value = random.choice('abcdefghijklmnopqrstuvwxyz')
                elif datatype == 'number':
                    value = str(random.randint(1, 100))
                elif datatype == 'float':
                    value = str(random.uniform(1, 100))
                else:
                    value = 'Unknown Data Type'
                row.append(value)
            writer.writerow(row)

# Usage example
input_file = 'input.txt'
output_file = 'output.csv'
generate_csv(input_file, output_file)
