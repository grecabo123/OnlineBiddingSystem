import axios from 'axios'
import { Card } from 'primereact/card'
import { Column } from 'primereact/column';
import { DataTable } from 'primereact/datatable'
import React, { useEffect, useState } from 'react'

function Acknow() {

    const [Data, setData] = useState([]);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        axios.get(`/api/Acknowledge/${localStorage.getItem('auth_id')}`).then(res => {
            if(res.data.status === 200) {
                setData(res.data.data)
            }
            setLoading(false);
        }).catch((error) => {
            
        })
    },[])

    const FormatPrice = (Data) => {
        return (
            <span>₱{Data.amout_bid.toFixed(2)}</span>
        )
    }

    return (
        <div>
            <Card title="Acknowledge">
                <DataTable value={Data} paginator paginatorLeft rows={9}>
                    <Column field='name_user' header="Name of Seller"></Column>
                    <Column field='name' header="Product Name"></Column>
                    <Column field='remark' header="Remark"></Column>
                    <Column field='amout_bid' body={FormatPrice} header="Bid Offer"></Column>
                </DataTable>
            </Card>
        </div>
    )
}

export default Acknow