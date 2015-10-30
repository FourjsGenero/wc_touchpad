IMPORT FGL wc_touchpad


MAIN
DEFINE l_touchpad RECORD
    touchpad STRING
END RECORD
DEFINE l_mode STRING

    CLOSE WINDOW SCREEN
    OPEN WINDOW w WITH FORM "wc_touchpad_test"

    WHILE TRUE
        MENU "" ATTRIBUTES(STYLE="dialog", COMMENT="Select Touchpad Example")
            ON ACTION pos ATTRIBUTES(TEXT="POS", COMMENT="Point of Sale (POS) example")
                LET l_mode = "pos"
            ON ACTION key ATTRIBUTES(TEXT="Keyboard", COMMENT="Full screen keyboard example")
                LET l_mode = "key"
            ON ACTION splash ATTRIBUTES(TEXT="Splash", COMMENT="Tap and Go example")
                LET l_mode = "splash"
            ON ACTION exit ATTRIBUTES(TEXT="Exit")
                LET l_mode = "exit"
            ON ACTION close
                LET l_mode = "exit"
        END MENU
        IF l_mode = "exit" THEN
            EXIT WHILE
        END IF

        INPUT BY NAME l_touchpad.* ATTRIBUTES(UNBUFFERED, ACCEPT=FALSE, CANCEL=FALSE)
            BEFORE INPUT
                CASE l_mode
                    WHEN "pos"
                        -- Define the size
                        CALL wc_touchpad.init_grid(3,5)

                        -- Define the images, X,Y,width,height, image, return value
                        CALL wc_touchpad.image_add2grid(1,1,1,1,wc_image("bigmac.jpg"),"Big Mac")
                        CALL wc_touchpad.image_add2grid(2,1,1,1,wc_image("hamburger.jpg"),"Hamburger")
                        CALL wc_touchpad.image_add2grid(3,1,1,1,wc_image("cheeseburger.jpg"),"Cheeseburger")
                        CALL wc_touchpad.image_add2grid(1,2,1,1,wc_image("smallfries.jpg"),"Small Fries")
                        CALL wc_touchpad.image_add2grid(2,2,1,1,wc_image("mediumfries.jpg"),"Medium Fries")
                        CALL wc_touchpad.image_add2grid(3,2,1,1,wc_image("largefries.jpg"),"Large Fries")
                        CALL wc_touchpad.image_add2grid(1,3,1,1,wc_image("largecoke.jpg"),"Coke")
                        CALL wc_touchpad.image_add2grid(2,3,1,1,wc_image("fanta.jpg"),"Fanta")
                        CALL wc_touchpad.image_add2grid(3,3,1,1,wc_image("sprite_zero.jpg"),"Sprite")
                        CALL wc_touchpad.image_add2grid(1,4,1,1,wc_image("banana_shake.jpg"),"Banana Shake")
                        CALL wc_touchpad.image_add2grid(2,4,1,1,wc_image("chocolate_shake.jpg"),"Chocolate Shake")
                        CALL wc_touchpad.image_add2grid(3,4,1,1,wc_image("strawberry_shake.jpg"),"Strawberry Shake")
                        CALL wc_touchpad.image_add2grid(1,5,1,1,wc_image("carmel_sundae.jpg"),"Caramel Sundae")
                        CALL wc_touchpad.image_add2grid(2,5,1,1,wc_image("choc_sundae.jpg"),"Chocolate Sundae")
                        CALL wc_touchpad.image_add2grid(3,5,1,1,wc_image("straw_sundae.jpg"),"Strawberry Sundae")
                        CALL wc_touchpad.html_send("formonly.touchpad")

                    WHEN "key"
                        --numerical keypad
                        CALL wc_touchpad.init_grid(3,4)
                        CALL wc_touchpad.text_add2grid(1,1,1,1,"7","7")
                        CALL wc_touchpad.text_add2grid(2,1,1,1,"8","8")
                        CALL wc_touchpad.text_add2grid(3,1,1,1,"9","9")
                        CALL wc_touchpad.text_add2grid(1,2,1,1,"4","4")
                        CALL wc_touchpad.text_add2grid(2,2,1,1,"5","5")
                        CALL wc_touchpad.text_add2grid(3,2,1,1,"6","6")
                        CALL wc_touchpad.text_add2grid(1,3,1,1,"1","1")
                        CALL wc_touchpad.text_add2grid(2,3,1,1,"2","2")
                        CALL wc_touchpad.text_add2grid(3,3,1,1,"3","3")
                        CALL wc_touchpad.text_add2grid(1,4,1,1,"-","minus")
                        CALL wc_touchpad.text_add2grid(2,4,1,1,"0","0")
                        CALL wc_touchpad.text_add2grid(3,4,1,1,".","decimal")
                        CALL wc_touchpad.html_send("formonly.touchpad")

                    WHEN "splash"
                        CALL wc_touchpad.init()
                        CALL wc_touchpad.image_add(0,0,100,100,wc_image("splash_iphone.jpg"),"Splash")
                        CALL wc_touchpad.html_send("formonly.touchpad")
                END CASE
                
            ON ACTION touchpad_clicked ATTRIBUTES(DEFAULTVIEW=NO)
                MESSAGE SFMT("Touchpad touched, value=%1", l_touchpad.touchpad)
            ON ACTION close
                EXIT INPUT
        END INPUT
    END WHILE
END MAIN

FUNCTION wc_image(l_img)
DEFINE l_img STRING

    RETURN ui.Interface.filenameToURI(SFMT("img/%1",l_img))
END FUNCTION

 