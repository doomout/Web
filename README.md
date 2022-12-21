# Web View 
웹 뷰란? 웹 콘텐츠를 뷰 형대로 보여주는 앱.  
스위프트 문법(함수).  
(예)2개의 파라미터를 받아서 반환하는 함수.  
func today(month: String, day: String) -> String {.  
    return "오늘은 \ (month)월 \ (day)일 입니다.".  
}.  

today(month: "12", day: "22").  

함수 호출을 C언어 처름 파라미터명 없이 사용하고 싶을 때는 _을 추가하면 C언어와 같이 함수 호출이 가능하다. 
(예). 
func today2(_ month:String, _ day:String) -> String {.  
    return "오늘은 \ (month)월 \ (day)일 입니다.".    
}.   

today2("12","23")   

