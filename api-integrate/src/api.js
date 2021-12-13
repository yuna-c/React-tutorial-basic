// API 함수를 호출해서 데이터를 반환해주는 작업
import axios from 'axios';

export async function getUsers() {
    const response = await axios.get('https://jsonplaceholder.typicode.com/users/');
    return response.data;
}

export async function getUser(id) {
    const response = await axios.get(`https://jsonplaceholder.typicode.com/users/${id}`);
    return response.data;
}