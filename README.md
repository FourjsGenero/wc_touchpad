# wc_touchpad
A WebComponent that turns your screen into a touchpad.  Intended to show how you can utilise the whole screen when you have a touch sensitive display.

The example shows 5 possibilities

1. POS - Point of Sale - shows an example screen utilising different products and you can click on the appropriate product image to indicate selection of the product
![POS](https://user-images.githubusercontent.com/13615993/32204585-1275ac20-be4f-11e7-9581-fb339a3f7c05.png)

2. Key - Shows how you can create a giant keypad, so like POS but instead of images, with text
![Keyboard](https://user-images.githubusercontent.com/13615993/32204584-123c10aa-be4f-11e7-9510-7aeb87d88d70.png)

3. HTML - Raw HTML text that includes an <a> tag that triggers a 4gl action
![HTML](https://user-images.githubusercontent.com/13615993/32204582-1207397a-be4f-11e7-82fe-525cdff879fa.png)

4. Hover - Shows how classes can be utilited to enahance the user experience.  In this case enlarging the image with hover
![Hover](https://user-images.githubusercontent.com/13615993/32204581-11cd23d4-be4f-11e7-9152-a5ac8af2a903.png)
 
 5. Wordle - Example showing how to create a similar keyboard to Wordle
 ![Wordle](https://user-images.githubusercontent.com/13615993/169926695-c188e9d1-1eee-4ccd-8540-7a56721e6103.png)
 
When you run the examples, note what appears in the MESSAGE panel when you click on something inside the webcomponent, this is showing that the 4gl action is triggered with the webcomponent variable being set to a particular value corresponding to what you clicked on.

The example has one action, the code could conceivably call different actions by altering execAction to have an extra parameter that is the name of the aciton to trigger.




TODO: Verify legality of Product images.  Where did I get them from?
