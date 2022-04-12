//
//  Services.swift
//  myTunes
//
//  Created by Caner Onat on 12.04.2022.
//

import Alamofire
import AlamofireMapper

class Services {
     let baseUrl = "https://itunes.apple.com/search?"
    
    // MARK: getData
    public func getData(term:String,media:String,successCompletion: @escaping ((_ json : ITunesDataModel) -> Void), errorCompletion: @escaping ((_ message : BaseModelError) -> Void)) {
          Alamofire.request(self.baseUrl + "term=\(term)" + "&media=\(media)", method: .get, encoding: JSONEncoding.default, headers: ["Content-Type":"application/json"]).responseObject { (response: DataResponse<ITunesDataModel>) in
              switch response.result {
              case .success(let model):
                  if response.response!.statusCode == APIStatusCodes.Success.rawValue {
                      successCompletion(model)
                  }else {
                      errorCompletion(BaseModelError(errorCode: nil, message: nil, errors: [ErrorData(field: APIErrors.Service.rawValue, message: "")]))
                  }
                  break
              case .failure(let error):
                  errorCompletion(BaseModelError(errorCode: nil, message: nil, errors: [ErrorData(field: APIErrors.Alamofire.rawValue, message: error.localizedDescription)]))
                  break
              }
          }
      }
    
   
}
