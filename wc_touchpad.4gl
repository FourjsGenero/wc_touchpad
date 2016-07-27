CONSTANT fudge = 0.3 -- Avoid situation where due to rounding error, line appears

DEFINE touchpad_html base.StringBuffer
DEFINE touchpad_size RECORD
    columns INTEGER,
    rows INTEGER
END RECORD
DEFINE img_class STRING



FUNCTION init()
    LET touchpad_html = base.StringBuffer.create()
    INITIALIZE touchpad_size.* TO NULL
    INITIALIZE img_class TO NULL
END FUNCTION



FUNCTION init_grid(columns, rows)
DEFINE columns, rows INTEGER
    CALL init()
    LET touchpad_size.columns = columns
    LET touchpad_size.rows = rows
END FUNCTION
    

    
FUNCTION image_add(top, left, width, height, image, value)
DEFINE top, left, width, height DECIMAL(11,2)
DEFINE image, value STRING

    CALL touchpad_html.append(SFMT("<div style=\"position: absolute; left: %1%%; top: %2%%; height: %3%%; width: %4%% \"><img class=\"%7\" src=\"%5\" height=\"100%%\" width=\"100%%\"  onclick=\"execAction('%6')\" /></div>", left USING "##&.&&", top USING "##&.&&",height USING "##&.&&", width USING "##&.&&", image, value, img_class))
END FUNCTION



FUNCTION image_add2grid(col, row, column_span, row_span, image, value)
DEFINE col, row, column_span, row_span INTEGER
DEFINE image, value STRING
DEFINE top, left, width, height DECIMAL(11,2)

    LET left = 100 * (col-1) / touchpad_size.columns
    LET top = 100 * (row-1) / touchpad_size.rows
    LET width = 100 * column_span / touchpad_size.columns + FUDGE
    LET height = 100 * row_span / touchpad_size.rows + FUDGE

    CALL image_add(top, left, width, height, image, value)
END FUNCTION



FUNCTION text_add(top, left, width, height, txt, value)
DEFINE top, left, width, height DECIMAL(11,2)
DEFINE txt, value STRING

    CALL touchpad_html.append(SFMT("<div style=\"position: absolute;  display: table; overflow: hidden; padding: 5px; background-color: #EEEEEE; border-width:2px; border-style:inset; border-radius:10px; left: %1%%; top: %2%%; height: %3%%; width: %4%% \"  onclick=\"execAction('%6')\" ><div style=\"text-align: center; vertical-align: middle; display: table-cell; font-size:40; \">%5</div></div>", left USING "##&.&&", top USING "##&.&&",height USING "##&.&&", width USING "##&.&&", txt, value))
END FUNCTION



FUNCTION text_add2grid(col, row, column_span, row_span, txt, value)
DEFINE col, row, column_span, row_span INTEGER
DEFINE txt, value STRING
DEFINE top, left, width, height DECIMAL(11,2)

    LET left = 100 * (col-1) / touchpad_size.columns
    LET top = 100 * (row-1) / touchpad_size.rows
    LET width = 90 * column_span / touchpad_size.columns + FUDGE
    LET height = 90 * row_span / touchpad_size.rows + FUDGE

    CALL text_add(top, left, width, height, txt, value)
END FUNCTION



FUNCTION html_append(txt)
DEFINE txt STRING
    CALL touchpad_html.append(txt)
END FUNCTION



FUNCTION html_send(fieldname)
DEFINE fieldname STRING
DEFINE l_result STRING

    CALL ui.interface.frontcall("webcomponent","call",[fieldname,"setById","touchpad_body",touchpad_html.toString()],l_result)
END FUNCTION



FUNCTION img_class_set(class)
DEFINE class STRING
    LET img_class = class
END FUNCTION