import axios from 'axios';
import { Skeleton } from 'primereact/skeleton';
import React, { useEffect, useRef, useState } from 'react'
import { Image } from 'primereact/image';
import swal from 'sweetalert';
import { DataTable } from 'primereact/datatable';
import { Column } from 'primereact/column';
import { Badge } from 'primereact/badge';
import { Tag } from 'primereact/tag';
import { Button } from 'primereact/button';
import moment from 'moment';
import { Dialog } from 'primereact/dialog';
import { Divider } from 'primereact/divider';
import { Toast } from 'primereact/toast';
import { InputText } from 'primereact/inputtext';


function ProductDetails({data}) {

    // console.log(data);

    const [ProductDetailsInfo, setProductDetailsInfo] = useState([]);
    const [BiddingUser, setBiddingUser] = useState([]);
    const [BiddingUserWin, setBiddingWin] = useState([]);
    const [loading, setloading] = useState(true);
    const [visible, setVisible] = useState(false);
    const [btnloading, setbtn] = useState(false);
    const [userid, setuserid] = useState([]);
    const [uniq, setkey] = useState([]);
    const [total, setTotal] = useState(0)
    const toast = useRef();
    const [TotalAmount, setTotalAmt] = useState()
    const [Amt, setTotalAmtprice] = useState([])
    const [Unitprice, setUnit] = useState([])

    useEffect(() => {

        axios.get(`/api/ProductDetailsInformation/${data}`).then(res => {
            if (res.data.status === 200) {
                setProductDetailsInfo(res.data.product);
                setBiddingUser(res.data.list);
                setBiddingWin(res.data.win)
            }
            else {
            }
            setloading(false);
        }).catch((error) => {
            if (error.response.status === 500) {
                swal("Warning", error.response.statusText, 'warning');
            }
        })
    }, [data]);
    

    const PriceFormat = (BiddingUser) => {
        return (
            <>
            ₱{
                BiddingUser.tbl_biddingprice_fk.toFixed(2)
            }
            </>
        )
    }

    const DateFormat = (BiddingUser) => {
        return (
            <span>{moment(BiddingUser.created_at).format('MMM DD YYYY hh:m a')}</span>
        )
    }

    const EndBidProduct = () => {
        setVisible(true);
    }

    const onhide = () => {
        setVisible(false)
    }

    const GetInfo = (e) => {
        setkey(e.currentTarget.getAttribute('data-uniq'));
        setuserid(e.currentTarget.getAttribute('data-user_id'));
        setTotalAmtprice(e.currentTarget.getAttribute('data-total'));
        setUnit(e.currentTarget.getAttribute('data-price_unit'))
    }

    const CloseBid = (e) => {
        e.preventDefault();

      
            setbtn(true)
            const data = {
                id: userid,
                uniq: uniq,
                from_user: localStorage.getItem('auth_id'),
                month: moment().format('MMM'),
                total_amt: Amt,
                quantity: total,
                unitprice: Unitprice,
            }
    
    
            axios.post(`/api/CloseBid`,data).then(res => {
                if(res.data.status === 200) {
                    setVisible(false);
                    setbtn(false)
                    toast.current.show({severity: "success",summary: "Close Bid", detail: "Successfully"});
                }
            }).catch((errro) => {
    
            })

    }

    const handleinput = (e) => {
        e.persist();
        setTotal(e.target.value);
    }


    return (
        <div className='container-fluid'>
            <Toast ref={toast} />
            <div className="row">
                    <div className="">
                        <div className="">
                            {
                                loading ? <Skeleton className='w-100' borderRadius='20' />
                                    :
                                    <>
                                        <Image width='100%' height='300' className='text-center mb-4 rounded w-100' src={`http://127.0.0.1:8000/${ProductDetailsInfo.image}`} tooltip='Image' alt='Photo' preview />
                                        <div className="col-lg-12 col-md-12 col-sm-12 mb-2">
                                            <p>{ProductDetailsInfo.description}</p>
                                        </div>
                                        <h6>Highest Bid: <Tag className='' severity={'success'} value={BiddingUserWin.name_user} /> - <Tag severity={'success'} value={`₱${BiddingUserWin.tbl_biddingprice_fk.toFixed(2)}`} /></h6>
                                        <div className="col-lg-12 col-md-12 col-sm-12 mb-2">
                                            <DataTable  value={BiddingUser} header="Bid User"  paginatorLeft paginator rows={10}>
                                                <Column field='name_user' header="Name of Bidder" ></Column>
                                                <Column field='tbl_biddingprice_fk' body={PriceFormat} header="Amount Bid" ></Column>
                                                <Column field='created_at' body={DateFormat} header="DateTime Bid" ></Column>
                                            </DataTable>
                                        </div>
                                        <div className="mt-3">
                                            <Button onClick={EndBidProduct}  className='p-button-sm p-button-info' label='End Bid' />
                                        </div>

                                    </>
                            }
                        </div>
                    </div>
            </div>
            <Dialog header="Product Details" onHide={onhide} style={{ width: '50vw' }} breakpoints={{ '960px': '75vw', '641px': '100vw' }} visible={visible} position='top' draggable={false}>
                <form onSubmit={CloseBid}>
                    {/* <div className="container"> */}
                        <ul className="list-group">
                            <li className="bg-transparent mb-2 list-group-item d-flex justify-content-between align-items-center border-0">
                                <span className='text-light'>Product Name: </span>
                                <span className='text-light'>{ProductDetailsInfo.name}</span>
                            </li>
                            <li className="bg-transparent mb-2 list-group-item d-flex justify-content-between align-items-center border-0">
                                <span className='text-light'>Product Price: </span>
                                <span className='text-light'>₱{ProductDetailsInfo.product_price}</span>
                            </li>
                            <li className="bg-transparent mb-2 list-group-item d-flex justify-content-between align-items-center border-0">
                                <span className='text-light'>Product Address: </span>
                                <span className='text-light'>{ProductDetailsInfo.address}</span>
                            </li>
                            <Divider>
                                <span className='p-tag'>Bid Winner</span>
                            </Divider>

                            <li className="bg-transparent mb-2 list-group-item d-flex justify-content-between align-items-center border-0">
                                <span className='text-light'>Bid Winner: </span>
                                <span className='text-light'>{BiddingUserWin.name_user}</span>
                            </li>
                            <li className="bg-transparent mb-2 list-group-item d-flex justify-content-between align-items-center border-0">
                                <span className='text-light'>Email Address: </span>
                                <span className='text-light'>{BiddingUserWin.email}</span>
                            </li>
                            {/* <li className="bg-transparent mb-2 list-group-item d-flex justify-content-between align-items-center border-0">
                                <span className='text-light'>Contact Number: </span>
                                <span className='text-light'>{BiddingUser.contact_number}</span>
                            </li> */}
                            <li className="bg-transparent mb-2 list-group-item d-flex justify-content-between align-items-center border-0">
                                <span className='text-light'>Bid Offer: </span>
                                <span className='text-light'>₱{BiddingUserWin.tbl_biddingprice_fk}</span>
                            </li>
                            
                            <li className="bg-transparent mb-2 list-group-item d-flex justify-content-between align-items-center border-0">
                                <span className='text-light'>{ProductDetailsInfo.price_unit === 2 ? "Quantity" : "Per Kilo"} </span>
                                {
                                    ProductDetailsInfo.price_unit === 2 ? <InputText className='p-inputtext-sm w-25' keyfilter={'pint'} required onChange={handleinput} placeholder='Number of Quantity' /> 
                                    :
                                    <InputText className='p-inputtext-sm w-25' placeholder='Weight Kilogram' name='kilo' onChange={handleinput} required />
                                }
                            </li>
                            <Divider>
                                <span className='p-tag'>Total</span>
                            </Divider>
                            <li className="bg-transparent mb-2 list-group-item d-flex justify-content-between align-items-center border-0">
                                <span className='text-light'>Total Amount: </span>
                                {/* <Button className='d-none' data-total={BiddingUserWin.tbl_biddingprice_fk * total} /> */}
                                <span className='text-light totalamount'>₱{(BiddingUserWin.tbl_biddingprice_fk * total).toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ",")}</span>
                            </li>
                            <Divider></Divider>
                            <div className="mt-3 d-flex justify-content-end">
                                <Button 
                                className='p-button-sm p-button-danger' 
                                loading={btnloading} 
                                label='Close Bid'
                                onClick={GetInfo}
                                data-uniq={ProductDetailsInfo.uniq_key} 
                                data-user_id={BiddingUserWin.id} 
                                data-total={BiddingUserWin.tbl_biddingprice_fk * total}
                                data-price_unit={ProductDetailsInfo.price_unit}
                                />
                            </div>
                        </ul>
                    {/* </div> */}
                </form>
            </Dialog>
        </div>
    )
}

export default ProductDetails