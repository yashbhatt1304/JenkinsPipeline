from flask import Flask,request,render_template
app=Flask(__name__)

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/calculate',methods=['POST'])
def calculate():
    ops=request.form.get('operation')
    num1=request.form.get('firstNumber',type=float)
    num2=request.form.get('secondNumber',type=float)
    
    if ops =="add":
        result=num1+num2
    elif ops =="subtract":
        result=num1-num2
    elif ops =="multiply":
        result=num1*num2
    elif ops =="divide":
        result=num1/num2
    elif (num1 is None or num2 is None):
        result="please enter the numbers"
    else:
        result="invalid operation"

    return render_template('index.html',result=result)

if __name__== '__main__':
    app.run(debug=True)