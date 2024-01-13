import axios from 'axios';
import moment from 'moment';
import { Badge } from 'primereact/badge';
import { Card } from 'primereact/card';
import { Column } from 'primereact/column';
import { DataTable } from 'primereact/datatable';
import { Skeleton } from 'primereact/skeleton';
import React, { useEffect, useState } from 'react'
import { FcFolder } from 'react-icons/fc';

function TableRecords() {

    const [loading, setloading] = useState(true);
    const [tbldata, settbldata] = useState([]);

    useEffect(() => {
        axios.get(`/api/AllItems`).then(res => {
            if (res.data.status === 200) {
                settbldata(res.data.results);
            }
            else {

            }
            setloading(false)
        }).catch((error) => {

        })
    }, []);


    const PriceFormat = (tbldata) => {
        return (
            <>
                <span>₱{tbldata.product_price.toFixed(2)}</span>
            </>
        )
    }


    return (
        <Card title="All Data">
            <DataTable loading={loading} value={tbldata} paginator paginatorLeft rows={5}>
                <Column field='product_name' header="Product Name"></Column>
                
                <Column field='product_price' body={PriceFormat} header="Product Price "></Column>
            </DataTable>
        </Card>
    )
}

export default TableRecords