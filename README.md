# wc_touchpad
A WebComponent that turns your screen into a touchpad

The example shows 4 possibilities

1. POS - Point of Sale - shows an example screen utilising different products and you can click on the appropriate product image to indicate selection of the product
2. Key - Shows how you can create a giant keypad, so like POS but instead of images, with text
3. Splash - Shows how this can be used to create a touch screen where you tap to continue.  NOTE: Since the introduction of ACTION attribute to IMAGE I would use that rather than a webcomponent
4. HTML - Raw HTML text that includes an <a> tag that triggers a 4gl action
 
When you run the examples, note what appears in the MESSAGE panel when you click on something inside the webcomponent, this is showing that the 4gl action is triggered with the webcomponent variable being set to a particular value

The example has one action, the code coould conceivably call different actions by altering execAction to have an extra parameter that is the name of the aciton to trigger.




TODO: Verify legality of Product images.
