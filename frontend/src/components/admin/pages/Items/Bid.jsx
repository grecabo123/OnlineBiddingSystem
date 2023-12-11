import axios from 'axios';
import { Button } from 'primereact/button';
import moment from 'moment';
import { Badge } from 'primereact/badge';
import { Card } from 'primereact/card'
import { Skeleton } from 'primereact/skeleton';
import React, { useEffect, useState } from 'react'
import DataTable,{createTheme} from 'react-data-table-component'
import {FcFolder} from 'react-icons/fc'

function Bid() {
    
    const [loading, setloading] = useState(true);
    const [tbldata, settbldata] = useState([]);

    useEffect(() => {
        axios.get(`/api/AllItems`).then(res => {
            if(res.data.status === 200) {
                settbldata(res.data.results);
            }
            else{

            }
            setloading(false)
        }).catch((error) => {

        })
    },[]);

    createTheme('solarized', {
        text: {
            primary: '#bfc5c7',
            secondary: '#2aa198',
        },
        background: {
            default: 'transparent',
        },
        context: {
            background: '#cb4b16',
            text: '#FFFFFF',
        },
        divider: {
            default: '#bfc5c7',
        },
        action: {
            button: 'rgba(0,0,0,.54)',
            hover: 'rgba(0,0,0,.08)',
            disabled: 'rgba(0,0,0,.12)',
        },
    }, 'dark');

    const column = [
        {
            name: "Product name",
            selector: row => <><FcFolder size={23} /> {row.name}</>,
            sortable: true,
        },
        {
            name: "Product type",
            selector: row => row.product_type,
            sortable: true,
        },
        {
            name: "Price",
            selector: row => "₱"+row.price,
        },
        {
            name: "Status",
            selector: row => row.price_status === 0 ? <Badge  severity={'danger'} value={'Not Sold'} /> : <Badge severity={'success'} value={'Sold'} />
        },
        {
            name: "Actions",
            cell: row => <div className=''>
                <Button className='p-button-sm w-100 mt-2 mb-2 p-button-info' label='View' />
                <Button className='p-button-sm w-100 p-button-danger mb-2' label='Delete' />
            </div>,
        },
 
    ]

    return (
        <div className='container-fluid'>
            <Card>
            <DataTable
                title={"Bidding Item"}
                theme='solarized'
                columns={column}
                data={tbldata}
                pagination
                selectableRows
                responsive={true}
                progressPending={loading}
                progressComponent={
                    <>
                        <Skeleton className='w-100' borderRadius='20' />
                    </>
                }
            />
            </Card>
        </div>
    )
}

export default Bid