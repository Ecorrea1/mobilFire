import 'package:mobilfire/common/Constant.dart';
import 'package:mobilfire/src/providers/httpExecute.dart';

class EndPoint {
  static getUser(id) {
    return HTTPExecute(generatedEndPointUrl("/users/$id")).get();
  }

  getPosts() {
    return HTTPExecute(generatedEndPointUrl("/post}")).get();
  }

  insertPosts(parameters) {
    return HTTPExecute(generatedEndPointUrl("/post}")).post(parameters);
  }

  getSpecificPost(userId, parameters) {
    return HTTPExecute(generatedEndPointUrl("/post?userId=$userId}"))
        .post(parameters);
  }

  updatePosts(parameters) {
    return HTTPExecute(generatedEndPointUrl("/post/${parameters['id']}"))
        .put(parameters);
  }

  deletePosts(id) {
    return HTTPExecute(generatedEndPointUrl("/post/$id}")).delete();
  }

  static generatedEndPointUrl(resource) {
    return Constant.DOMAIN + "${Constant.PATH}$resource";
  }
}
