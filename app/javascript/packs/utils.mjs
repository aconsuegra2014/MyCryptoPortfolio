export function ready(callbackFunction) {
    if (document.readyState != 'loading')
        callbackFunction(event)
    else
        document.addEventListener("turbolinks:load", callbackFunction)
}

export function bindEvent(domElement, event, callback) {
    if (domElement)
        domElement.addEventListener(event, callback)
}
