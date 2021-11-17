import React from 'react';
import classNames from 'classnames';
import './Button.scss';


// size : large, medium, small
// color : blue, pink, gray 
function Button({children, size, color, outline, fullWidth, className, ...rest}) {
    console.log(rest);
    return (
        <button className={classNames('Button', size, color, {
            // outline, fullWidth 값이 없으면 undefind고 classNames에서 처리하지 않는다
            outline,
            fullWidth
        }, className)}
        {...rest}
        >
            {children}
        </button>
    );
}

Button.defaultProps = {
    size : 'medium',
    color : 'blue'
}

//" Button medium"
export default Button;
