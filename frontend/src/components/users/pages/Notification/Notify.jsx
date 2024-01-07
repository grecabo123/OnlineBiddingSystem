import axios from 'axios';
import { Card } from 'primereact/card'
import { Column } from 'primereact/column';
import { DataTable } from 'primereact/datatable';

import React, { useEffect, useState } from 'react'
import swal from 'sweetalert';

function Notify() {

    const [loading, setloading] = useState(true);
    const [NotificationData, setNotification] = useState([])

    useEffect(() => {
        axios.get(`/api/Notification/${localStorage.getItem('auth_id')}`).then(res => {
            if(res.data.status === 200) {
                setNotification(res.data.data);
            }
            setloading(false)
        }).catch((error) => {
            if(error.response.status === 500) {
                swal("Warning",error.response.statusText,'warning');
            }
        })
    },[]);

    const FormatNum = (NotificationData) => {
        return (
            <>
                <span>₱{NotificationData.total_amount.toFixed(2)}</span>
            </>
        )
    }
    
    const FormatNumTotal = (NotificationData) => {
        return (
            <>
                <span>₱{NotificationData.total_amount.toFixed(2)}</span>
            </>
        )
    }

    return (
        <div>
            <Card title="Notify From Bid">
               <DataTable value={NotificationData} loading={loading} rows={9} paginator paginatorLeft>
                    <Column field='name_user' header="Name of Seller"></Column>
                    <Column field='email' header="Email"></Column>
                    <Column field='name' header="Name of Product"></Column>
                    <Column field='total_amount' body={FormatNum} header="Your Bid Offer"></Column>
                    <Column field='total' body={FormatNumTotal} header="Total Price"></Column>
               </DataTable>
            </Card>
        </div>
    )
}

export default Notify