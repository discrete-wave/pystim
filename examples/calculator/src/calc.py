#file name: custom_math.py

class Calculator:

    def __init__(self):
        self.last_result = None        

    def add(self, a, b):
        res = a + b
        self.last_result = res
        return res

    def subtract(self, a, b):
        res = a - b
        self.last_result = res
        return res
        
    def get_last_result(self):
        return self.last_result
