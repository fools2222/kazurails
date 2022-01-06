// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

"use strict";

window.onload = function() {
    var textQuantityElems = document.querySelectorAll('#mitsumori-js .text-quantity');
    textQuantityElems = Array.prototype.slice.call(textQuantityElems, 0);
    textQuantityElems.forEach(function (textQuantityElem, textQuantityIndex) {
        if (textQuantityElem.value!='') textQuantityElem.value='';
        textQuantityElem.addEventListener('keyup', calcPrice, false);
        textQuantityElem.addEventListener('blur', calcPrice, false);
    });
    var radioQuantityElems = document.querySelectorAll('#mitsumori-js .radio-quantity');
    radioQuantityElems = Array.prototype.slice.call(radioQuantityElems, 0);
    radioQuantityElems.forEach(function (radioQuantityElem, radioQuantityIndex) {
        if (radioQuantityElem.checked) radioQuantityElem.checked=false;
        radioQuantityElem.addEventListener('change', calcPrice, false);
    });
    var checkQuantityElems = document.querySelectorAll('#mitsumori-js .check-quantity');
    checkQuantityElems = Array.prototype.slice.call(checkQuantityElems, 0);
    checkQuantityElems.forEach(function (checkQuantityElem, checkQuantityIndex) {
        if (checkQuantityElem.checked) checkQuantityElem.checked=false;
        checkQuantityElem.addEventListener('change', calcPrice, false);
    });
    var selectQuantityElems = document.querySelectorAll('#mitsumori-js .select-quantity');
    selectQuantityElems = Array.prototype.slice.call(selectQuantityElems, 0);
    selectQuantityElems.forEach(function (selectQuantityElem, selectQuantityIndex) {
        selectQuantityElem.selectedIndex=0;
        selectQuantityElem.addEventListener('change', calcPrice, false);
    });

    function calcPrice() {
        var subtotal = 0,
            tax = 0,
            total = 0,
            itemNum = event.target.getAttribute('data-itemnum'),
            taxFlg = parseInt(document.querySelector('.mitsumori-js-total-tbl').getAttribute('data-taxflg')),
            items = document.querySelectorAll('.mitsumori-js-item');
        items = Array.prototype.slice.call(items, 0);
        items.forEach(function (itemElem, itemIndex) {
            if (itemElem.getAttribute('data-itemnum') == itemNum) {
                if (event.target.classList.contains('text-quantity')) {
                    itemElem.querySelector('.item-price span').textContent = escapeHtml(event.target.value) * escapeHtml(itemElem.querySelector('.unit-price').value);
                } else if (event.target.classList.contains('radio-quantity')) {
                    itemElem.querySelector('.item-price span').textContent = escapeHtml(event.target.value);
                } else if (event.target.classList.contains('check-quantity')) {
                    var checkLabels = itemElem.querySelectorAll('.check-quantity');
                    var _total = 0;
                    checkLabels = Array.prototype.slice.call(checkLabels, 0);
                    checkLabels.forEach(function (checkLabelElem, checkLabelIndex) {
                        if (checkLabelElem.checked) {
                            _total += parseInt(escapeHtml(checkLabelElem.value));
                        }
                    });
                    itemElem.querySelector('.item-price span').textContent = _total;
                } else if (event.target.classList.contains('select-quantity')) {
                    itemElem.querySelector('.item-price span').textContent = escapeHtml(itemElem.querySelector('.select-quantity').value);
                }
            }

            if (itemElem.querySelector('.item-price span').textContent != '') {
                subtotal += parseInt(itemElem.querySelector('.item-price span').textContent);
            }
        });

        if (taxFlg == 1) {
            tax = subtotal * (parseInt(document.querySelector('#mitsumori-js-tax-rate').textContent) / 100);
            tax = Math.floor(tax);
            document.querySelector('#mitsumori-js-subtotal').textContent = subtotal;
            document.querySelector('#mitsumori-js-tax').textContent = tax;
            document.querySelector('#mitsumori-js-total').textContent = subtotal + tax;
        } else {
            document.querySelector('#mitsumori-js-total').textContent = subtotal;
        }

        var outputContents = document.querySelectorAll('textarea.mitsumori-js-output');
        outputContents = Array.prototype.slice.call(outputContents, 0);
        outputContents.forEach(function(outputElem, outputIndex) {
            var outputHtml = '', mjItems = document.querySelectorAll('.mitsumori-js-item'), mjTotalItems = document.querySelectorAll('.mitsumori-js-total-tbl tr');
            mjItems = Array.prototype.slice.call(mjItems, 0);
            mjItems.forEach(function(mjElem, mjIndex){
                var txtItemName = mjElem.querySelector('.item-name').textContent,
                    txtItemPrice = mjElem.querySelector('.item-price').textContent;
                if (mjElem.querySelector('.unit-price') != null) {
                    var valUnitPrice = escapeHtml(mjElem.querySelector('.unit-price').value),
                        valTextQuantity = escapeHtml(mjElem.querySelector('.text-quantity').value);
                    if (valUnitPrice != '' && valTextQuantity != '') {
                        outputHtml += txtItemName;
                        outputHtml += '（￥' + valUnitPrice + ' × ' + valTextQuantity + '）';
                        outputHtml += '： ' + txtItemPrice +'\n';
                    }
                }
                if (mjElem.querySelector('.radio-quantity') != null) {
                    var radioItems = mjElem.querySelectorAll('.radio-quantity');
                    radioItems = Array.prototype.slice.call(radioItems, 0);
                    radioItems.forEach(function(radioElem, radioIndex){
                        if (radioElem.checked) {
                            var txtRadioItemName = radioElem.parentNode.textContent,
                            valRadioQuantity = escapeHtml(radioElem.value);
                            if (valRadioQuantity != '') {
                                outputHtml += txtItemName;
                                outputHtml += '（' + txtRadioItemName + ' ￥' + valRadioQuantity + '）';
                                outputHtml += '： ' + txtItemPrice +'\n';
                            }
                        }
                    });
                }
                if (mjElem.querySelector('.check-quantity') != null) {
                    var checkItems = mjElem.querySelectorAll('.check-quantity');
                    checkItems = Array.prototype.slice.call(checkItems, 0);
                    var checkItemFlg = false, checkItemContents = '';
                    checkItems.forEach(function(checkElem, checkIndex){
                        if (checkElem.checked) {
                            var txtCheckItemName = checkElem.parentNode.textContent,
                                valCheckQuantity = escapeHtml(checkElem.value);
                            if (valCheckQuantity != '') {
                                if (!checkItemFlg) {
                                    checkItemContents += txtCheckItemName + '：￥' + valCheckQuantity;
                                } else {
                                    checkItemContents += ', ' + txtCheckItemName + '：￥' + valCheckQuantity;
                                }
                            }
                            checkItemFlg = true;
                        }
                    });
                    if (checkItemFlg) {
                        outputHtml += txtItemName + '\n';
                        outputHtml += '（' + checkItemContents + '）\n';
                        outputHtml += '： ' + txtItemPrice +'\n';
                    }
                }
                if (mjElem.querySelector('.select-quantity') != null) {
                    var optItems = mjElem.querySelectorAll('.select-quantity option');
                    optItems = Array.prototype.slice.call(optItems, 0);
                    optItems.forEach(function(optElem, optIndex){
                        if (optElem.selected) {
                            var txtOptName = optElem.textContent,
                            valOpt = escapeHtml(optElem.value);
                            if (valOpt != '') {
                                outputHtml += txtItemName;
                                outputHtml += '（' + txtOptName + ' ￥' + valOpt + '）';
                                outputHtml += '： ' + txtItemPrice +'\n';
                            }
                        }
                    });
                }
            });
            outputHtml += '\n\n';
            mjTotalItems = Array.prototype.slice.call(mjTotalItems, 0);
            mjTotalItems.forEach(function(mjtElem, mjtIndex){
                outputHtml += mjtElem.querySelector('th').textContent + mjtElem.querySelector('td').textContent + '\n';
            });
            outputElem.textContent = outputHtml;
        });
    }

    function escapeHtml(str) {
        str = str.replace(/&/g, '&amp;');
        str = str.replace(/</g, '&lt;');
        str = str.replace(/>/g, '&gt;');
        str = str.replace(/"/g, '&quot;');
        str = str.replace(/'/g, '&#39;');
        return str;
    }
}
