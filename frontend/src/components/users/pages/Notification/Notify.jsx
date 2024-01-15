import axios from 'axios';
import { PrimeIcons } from 'primereact/api';
import { Badge } from 'primereact/badge';
import { Button } from 'primereact/button';
import { Card } from 'primereact/card'
import { Column } from 'primereact/column';
import { DataTable } from 'primereact/datatable';
import { Dialog } from 'primereact/dialog';
import { Rating } from 'primereact/rating';

import React, { useEffect, useState } from 'react'
import swal from 'sweetalert';

function Notify() {

    const [loading, setloading] = useState(true);
    const [visible, setVisible] = useState(false);
    const [NotificationData, setNotification] = useState([])
    const [value, setValue] = useState();

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
                <span>₱{NotificationData.total.toFixed(2)}</span>
            </>
        )
    }

    const PriceUnit = (Notification) => {
        return (
            <>
                {
                    Notification.price_unit === 1 ? <Badge value={'Per Kilo'} /> : <Badge value={'Per Pieces'} />
                }
            </>
        )
    }
    const Hide = () => {
        setVisible(false)
    }

    const Weight = (NotificationData) => {
        return (
            <>
                {
                    NotificationData.price_unit === 1 ? <span>{NotificationData.weight} / Kilo</span> : <span>{NotificationData.weight} / Pieces</span>
                }
            </>
        )
    }

    const RatingAccount = (NotificationData) => {
        return (
            <>
                <Button className='p-button-sm p-button-success' label='Rate' icon={PrimeIcons.STAR} data-seller={NotificationData.user_seller_fk} onClick={GetRate} />
            </>
        )
    }

    const GetRate = (e) => {
        setVisible(true)
    }

    return (
        <div>
            <Card title="Notify From Bid">
               <DataTable value={NotificationData} loading={loading} rows={9} paginator paginatorLeft>
                    <Column field='name_user' header="Name of Seller"></Column>
                    <Column field='email' header="Email"></Column>
                    <Column field='name' header="Name of Product"></Column>
                    <Column field='price_unit' body={PriceUnit} header="Price Unit"></Column>
                    <Column field='total_amount' body={FormatNum} header="Your Bid Offer"></Column>
                    <Column field='weight' body={Weight} header="Unit"></Column>
                    <Column field='total' body={FormatNumTotal} header="Total Price"></Column>
                    <Column field='user_seller_fk' body={RatingAccount} header="Action"></Column>
               </DataTable>
            </Card>

            <Dialog header="Account Rating" style={{ width: '40vw' }} breakpoints={{ '960px': '75vw', '641px': '100vw' }} onHide={Hide} draggable={false} position='top' visible={visible}>
                <form >
                    <div className="container">
                        <div className="row">
                            <div className="col-lg-12 mb-2">
                                <Rating cancel={false} value={value} onChange={(e) => setValue(e.value)} />
                            </div>
                        </div>
                    </div>
                </form>
            </Dialog>
        </div>
    )
}

export default Notify