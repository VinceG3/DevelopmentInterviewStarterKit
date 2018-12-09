import axios from 'axios';

const apiRequest = function(endpoint, method, params) {
  const uri = `${process.env.API_URL}/${endpoint}`;
  return method(uri, params)
    .then(res => { this.complete(res.data) })
    .catch(err => { this.error(err) })
};

const service = {};

service.getRequest = function(endpoint, params) {
  return apiRequest.call(this, endpoint, axios.get, params);
}

service.postRequest = function(endpoint, params) {
  return apiRequest.call(this, endpoint, axios.post, params);
}

export default service;
