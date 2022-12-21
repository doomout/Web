import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet var txtUrl: UITextField!
    @IBOutlet var myWebView: WKWebView!
    @IBOutlet var myActivityIndicator: UIActivityIndicatorView!
    
    //웹페이지 주소를 url의 인수를 통해 전달 해서 웹 페이지를 보여줌
    func loadWebPage(_ url: String){
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        myWebView.load(myRequest)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //웹뷰가 로딩중인지 확인용 델리게이트
        myWebView.navigationDelegate = self
        loadWebPage("https://www.google.com")
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        myActivityIndicator.startAnimating()
        myActivityIndicator.isHidden=false
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden=true
    }
    
    func checkUrl(_ url: String) -> String {
        var strUrl = url //입력받은 url 스트링을 임시 변수 strUrl 에 넣습니다.
        let flag = strUrl.hasPrefix("http://") //http:// 를 가지고 있는지 확인한 flag에 넣는다.
        //"http://"를 가지고 있지 않다면 추가하고 리턴한다.
        if !flag {
            strUrl = "http://" + strUrl
        }
        return strUrl
    }
    
    @IBAction func btnGotoUrl(_ sender: UIButton) {
        let myUrl = checkUrl(txtUrl.text!)
        txtUrl.text = ""
        loadWebPage(myUrl)
    }
    
    @IBAction func btnGoSite1(_ sender: UIButton) {
        loadWebPage("https://www.daum.net")
    }
    
    @IBAction func btnGoSite2(_ sender: UIButton) {
        loadWebPage("https://www.naver.com")
    }
    
    @IBAction func btnLoadHtmlString(_ sender: UIButton) {
        //html 문을 변수에 저장
        let htmlString = "<h1>HTML String </h1><p> String 변수를 이용한 웹 페이지 </p><p><a href=\"https://www.youtube.com\">유튜브</a>으로 이동</p>"
        //변수에 저장한 HTML문을 웹 뷰에 나타낸다.
        myWebView.loadHTMLString(htmlString, baseURL: nil)
    }
    
    @IBAction func btnLoadHtmlFile(_ sender: UIButton) {
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html") //파일에 대한 패스 변수를 생성
        let myUrl = URL(fileURLWithPath: filePath!) //패스 변수를 이용하여 URL 변수를 생성
        let myRequest = URLRequest(url: myUrl) //URL 변수를 이용하여 Request 변수를 생성합니다.
        myWebView.load(myRequest) //Request 변수를 이용하여 HTML 파일을 로딩한다.
    }
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading()
    }
    
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        myWebView.reload()
    }
    
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        myWebView.goBack()
    }
        
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }
}

