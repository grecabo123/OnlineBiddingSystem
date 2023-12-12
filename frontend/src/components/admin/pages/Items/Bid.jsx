import axios from 'axios';
import { Button } from 'primereact/button';
import moment from 'moment';
import { Badge } from 'primereact/badge';
import { Card } from 'primereact/card'
import { Skeleton } from 'primereact/skeleton';
import React, { useEffect, useState } from 'react'
import {FcFolder} from 'react-icons/fc'
import { DataTable } from 'primereact/datatable';
import { Column } from 'primereact/column';
import { Tag } from 'primereact/tag';

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
    
    const PriceUnit = (tbldata) => {
        return (
            <>
            {
                tbldata.quantity_product === 1 ? <Tag className='p-tag' severity={'info'} value="Per Kilo" /> : <Tag className='p-tag' value="Per Pieces" />
            }
            </>
        )
    }
    const PriceFormat = (tbldata) => {
        return(
            <>
                ₱{tbldata.product_price.toFixed(2)}
            </>
        )
    }
    const StatusProduct = (tbldata) => {
        return(
            <>
                {tbldata.price_status === 0  ? <Tag severity={'info'} value="Selling" /> : <Tag severity={'success'} value="Sold" />}
            </>
        )
    }



    return (
        <div className='container-fluid'>
            <Card title="My Product">
                <DataTable value={tbldata} paginator paginatorLeft rows={10}>
                    <Column field='product_name' header="Product Name"></Column>
                    <Column field='product_price' body={PriceFormat} header="Product Price"></Column>
                    <Column field='quantity_product' body={PriceUnit} header="Price Unit"></Column>
                    <Column field='price_status' body={StatusProduct} header="Product Status"></Column>
                </DataTable>
            </Card>
        </div>
    )
}

export default Bid