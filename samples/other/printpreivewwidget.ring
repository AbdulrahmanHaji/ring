load "guilib.ring"

new qApp {
        win1 = new qwidget() {
                setwindowtitle("Printer")
                setgeometry(100,100,500,500)
                new qpushbutton(win1) {
                        setGeometry(20,20,100,30)
                        settext("Print")
                        setclickevent("print()")
                }
		printer1 = new qPrinter(0)
		oPreview = new qPrintPreviewWidget(printer1) {
			setParent(win1)
			move(100,100) 	resize(500,500)
			setPaintrequestedevent("printPreview()")
		}
                showmaximized()
        }
        exec()
}

func printPreview
        printer1  {
                painter = new qpainter() {
                        begin(printer1)
                        myfont = new qfont("Times",50,-1,0)
                        setfont(myfont)
                        drawtext(100,100,"Test - Page (1)")
                        printer1.newpage()
                        drawtext(100,100,"Test - Page (2)")
			 printer1.newpage()
                        myfont2 = new qfont("Times",14,-1,0)
                        setfont(myfont2)
			for x = 1 to 30
				drawtext(100,100+(20*x),"Number : " + x)
			next 
                        endpaint()
                }
        }

func print
	oPreview.print()
