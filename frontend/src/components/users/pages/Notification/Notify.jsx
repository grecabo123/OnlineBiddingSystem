import axios from 'axios';
import { PrimeIcons } from 'primereact/api';
import { Badge } from 'primereact/badge';
import { Button } from 'primereact/button';
import { Card } from 'primereact/card'
import { Column } from 'primereact/column';
import { DataTable } from 'primereact/datatable';
import { Dialog } from 'primereact/dialog';
import { InputText } from 'primereact/inputtext';
import { InputTextarea } from 'primereact/inputtextarea';
import { Rating } from 'primereact/rating';
import { Toast } from 'primereact/toast';

import React, { useEffect, useState } from 'react'
import { useRef } from 'react';
import swal from 'sweetalert';

function Notify() {

    const [loading, setloading] = useState(true);
    const [visible, setVisible] = useState(false);
    const [NotificationData, setNotification] = useState([])
    const [value, setValue] = useState(0);
    const [Details, setDetails] = useState({
        name: "",
        email: "",
        user_fk: "",
        id: "",
    });
    const toast = useRef();
    const [sayword,setsayword] = useState("");

    useEffect(() => {
        axios.get(`/api/Notification/${localStorage.getItem('auth_id')}`).then(res => {
            if (res.data.status === 200) {
                setNotification(res.data.data);
            }
            setloading(false)
        }).catch((error) => {
            if (error.response.status === 500) {
                swal("Warning", error.response.statusText, 'warning');
            }
        })
    }, []);

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
                {
                    NotificationData.rate_acc === 1 ? <Badge severity={'success'} value={'Rated'} /> : 
                    <Button className='p-button-sm p-button-warning' label='Rate'
                    icon={PrimeIcons.STAR}
                    data-seller={NotificationData.user_seller_fk}
                    data-name={NotificationData.name_user}
                    data-email={NotificationData.email}
                    data-id={NotificationData.id}
                    onClick={GetRate} />
                }
            </>
        )
    }

    const GetRate = (e) => {
        setVisible(true)
        setDetails({
            name: e.currentTarget.getAttribute('data-name'),
            email: e.currentTarget.getAttribute('data-email'),
            user_fk: e.currentTarget.getAttribute('data-seller'),
            id: e.currentTarget.getAttribute('data-id'),
        })
    }

    const AccountRate = (e) => {
        e.preventDefault();

        const data = {
            name: Details.name,
            // user_fk: Details.user_fk,
            star: value,
            say: sayword,
            transaction_id: Details.id,
            buyer_fk: localStorage.getItem('auth_id'),
        }

        axios.put(`/api/RateAccount`,data).then(res => {
            if(res.data.status === 200) {
                setVisible(false)
                document.getElementById('reset').reset();
                toast.current.show({seveiry: "success", summary: "Rate Submitted", detail: "Successfully"});
                setTimeout(() => {
                    window.location.reload();
                },1500)
            }
        }).catch((error) => {
            if(error.response.status === 500) {

            }
        })

    }

    return (
        <div>
            <Toast ref={toast} />
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
                <form onSubmit={AccountRate} id='reset' >
                    <div className="container">
                        <div className="row">
                            <div className="col-lg-12 mb-2">
                                <label htmlFor="" className="form-label">
                                    Name of Seller
                                </label>
                                <InputText readOnly value={Details.name} className='w-100 border-0' />
                            </div>
                            <div className="col-lg-12 mb-2">
                                <label htmlFor="" className="form-label">
                                    Email
                                </label>
                                <InputText readOnly value={Details.email} className='w-100 border-0' />
                            </div>
                            <div className="col-lg-12 mb-2">
                                <InputTextarea className='w-100' value={sayword} onChange={(e) => setsayword(e.target.value)} rows={5} cols={5} style={{resize: 'none'}} placeholder='Say Something...' />
                            </div>
                            <div className="col-lg-12 mb-2">
                                <label htmlFor="" className="form-label">
                                    Give Rating
                                </label>
                                <Rating cancel={false} value={value} stars={8} onChange={(e) => setValue(e.value)} />
                            </div>
                            <div className="mt-2 d-flex justify-content-end">
                                <Button className='w-100 p-button-sm ' raised label='Submit' />
                            </div>
                        </div>
                    </div>
                </form>
            </Dialog>
        </div>
    )
}

export default Notify