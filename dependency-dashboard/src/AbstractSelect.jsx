import React from 'react'
import Select from '@material-ui/core/Select';

const abstractSelect = (props) => {
    return (
        <div>
            <Select
                className='select'
                open={props.open}
                onClose={props.handleClose}
                onOpen={props.handleOpen}
                value={props.selectedItem}
                onChange={props.handleChange}
            >
                {props.organizationList}
            </Select>
        </div>
    )
}

export default abstractSelect;
