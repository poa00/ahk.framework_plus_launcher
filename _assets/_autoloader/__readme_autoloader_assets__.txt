;;
;; Assets / _autoloader Readme - Josh 'Acecool' Moser
;;
This folder houses templates which are used in conjunction with our load-order-full/basic file...



__default__.ahk is the base file we use when building the load-order.. This is the main file header..... Lets call it the active-loader file...

__pre_load_order__.ahk is loaded into the active-loader file prior to any includes / runs being added by the autoloader. This is the inclusion-list header...

__post_load_order__.ahk is loaded into active-loader file after all includes / runs have been added... This is the file footer...


These files exist so if something always has to happen first, or last or if you want to add certain things that always happens... they're there for you.