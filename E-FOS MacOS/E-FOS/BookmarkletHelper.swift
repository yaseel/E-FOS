import AppKit

func copyNeptunLoginBookmarklet() {
    let username = loadFromKeychain(account: "neptun_username") ?? ""
    let password = loadFromKeychain(account: "neptun_password") ?? ""

    let bookmarklet = "javascript:(function(){document.getElementById('user').value='\(username)';document.getElementById('password').value='\(password)';document.querySelector(\"button[type='submit']\").click();})();"

    let pasteboard = NSPasteboard.general
    pasteboard.clearContents()
    pasteboard.setString(bookmarklet, forType: .string)
}
