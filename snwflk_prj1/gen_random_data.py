import csv
import random
from datetime import datetime, timedelta

def generate_csv(file_name, field_names):
    with open(file_name, mode='w', newline='') as csv_file:
        writer = csv.writer(csv_file, delimiter='~', quotechar='"', quoting=csv.QUOTE_MINIMAL)
        writer.writerow(field_names)
        for i in range(1000):
            row = []
            for field in field_names:
                if field.split('|')[1] == 'int':
                    row.append(random.randint(1, 100))
                elif field.split('|')[1] == 'float':
                    row.append(random.uniform(1.0, 100.0))
                elif field.split('|')[1] == 'str':
                    row.append(''.join(random.choices('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ', k=10)))
                elif field.split('|')[1] == 'date':
                    start_date = datetime.now() - timedelta(days=365)
                    end_date = datetime.now()
                    time_between_dates = end_date - start_date
                    days_between_dates = time_between_dates.days
                    random_number_of_days = random.randrange(days_between_dates)
                    random_date = start_date + timedelta(days=random_number_of_days)
                    row.append(random_date.strftime('%Y-%m-%d'))
            writer.writerow(row)

if __name__ == '__main__':
    file_name = 'output.csv'
    field_names = ['Field1|int', 'Field2|float', 'Field3|str', 'act_week|date']
    generate_csv(file_name, field_names)
