import React from 'react';
import { BrowserRouter, Route, Routes } from 'react-router-dom';
import About from './About';

const Router = () => {
    return (
       <BrowserRouter>
            <Routes>
                <Route path='/' element={<About/>} />
            </Routes>
       </BrowserRouter>
    )
}

export default Router;
