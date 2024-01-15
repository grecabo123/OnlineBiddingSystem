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
import { PrimeIcons } from 'primereact/api';
import { InputTextarea } from 'primereact/inputtextarea';


function ProductDetails({ data }) {

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
    const [UserId, setuser] = useState()
    const [Amt, setTotalAmtprice] = useState([])
    const [Unitprice, setUnit] = useState([])
    const [BuyerListData, setBuyerList] = useState([])
    const [BuyerListDataloading, setBuyerListloading] = useState(true)
    const [BuyerModulemodal, setBuyer] = useState(false);
    const [ScheduleModal, setBuyerSchedule] = useState(false);
    const [comment, setComment] = useState()
    const [schedtext, setText] = useState();
    const [userfk, setuserfk] = useState()
    const [saveshed, setSave] = useState(false);
    const [WinnerBid, setWinner] = useState({
        name: "",
        email: "",
        contact: "",
        offer: "",
        id: "",
    }); 
    const [StartingPrice, setStartingPrice] = useState();

    useEffect(() => {
        getFetchData();
        // getBuyerList();
    }, []);




    const getFetchData = () => {
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
    }



    const getBuyerList = () => {
        axios.get(`/api/Buyerlist/${data}`).then(res => {
            if (res.data.status === 200) {
                setBuyerList(res.data.data)
            }
            setBuyerListloading(false);
        }).catch((error) => {
            if (error.response.status === 500) {
                swal("Warning", error.response.statusText, 'warning');
            }
        })
    }



    const CloseBidModal = () => {
        setVisible(true);
    }

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
        // setVisible(true);
        setBuyer(true)
        // setTimeout(() => {
        getBuyerList();
        // }, 1500);

        // getBuyerList();

    }



    const onhide = () => {
        // setVisible(false)
        setBuyer(false)
        // setBuyerSchedule(false)
        setuser("")
    }
    const hidebuyermodal = () => {
        setBuyerSchedule(false)
    }
    const transactionhide =() => {
        setVisible(false)
    }

    const GetInfo = (e) => {
        setkey(e.currentTarget.getAttribute('data-uniq'));
        setTotalAmtprice(e.currentTarget.getAttribute('data-total'));
        setStartingPrice(e.currentTarget.getAttribute('data-starting'));
        setUnit(e.currentTarget.getAttribute('data-price_unit'))
        setuserid(e.currentTarget.getAttribute('data-user_id'));
    }

    const CloseBid = (e) => {
        e.preventDefault();
        setbtn(true)
        const data = {
            id: userid, // winner user id
            uniq: uniq, // product key 
            from_user: localStorage.getItem('auth_id'), // buyer
            month: moment().format('MMM'),
            total_amt: Amt,  // amt bid
            starting: StartingPrice,
            quantity: total,
            unitprice: Unitprice,
        }

        // console.log(data);

        axios.post(`/api/CloseBid`, data).then(res => {
            if (res.data.status === 200) {
                setVisible(false);
                setbtn(false)
                toast.current.show({ severity: "success", summary: "Close Bid", detail: "Successfully" });
            }
        }).catch((error) => {
            if(error.response.status === 500) {
                swal("Warning",error.response.statusText,'warning');
            }
        })

    }

    const handleinput = (e) => {
        e.persist();
        setTotal(e.target.value);
    }



    const ButtonActions = (BiddingUser) => {
        return (
            <>
                {
                    BiddingUser.status === 0 ? <Button className='p-button-sm p-button-info' onClick={BuyerModule} data-user={BiddingUser.user_id} data-product={data} label='Add Record' />
                        :
                        <Badge value={'Added'} severity={'success'} />
                }
            </>
        )
    }

// console.log(BuyerListData);
    const BuyerModule = (e) => {
        // alert(e.currentTarget.getAttribute('data-user'))

        const data = {
            user: e.currentTarget.getAttribute('data-user'),
            product: e.currentTarget.getAttribute('data-product')
        }

        axios.post(`/api/AddedList`, data).then(res => {
            if (res.data.status === 200) {
                toast.current.show({ severity: "success", summary: "Added List of Buyer", detail: "Successfully" });
                getFetchData();
            }
        }).catch((error) => {
            if (error.response.status === 500) {

            }
        })
    }

    const ActionButton = (BuyerListData) => {
        return (
            <>
                {
                    BuyerListData.buyer_pick === 0 ?
                    <Button className='p-button-info me-2 p-button-sm' label='View' data-user={BuyerListData.id} onClick={ModalSchedule} data-id={BuyerListData.user_fk} data-comment={BuyerListData.comment} />
                    :
                    <Button 
                        className='p-button-success me-2 p-button-sm' 
                        label='Transaction' 
                        onClick={TransactionModal} 
                        data-name={BuyerListData.name_user}
                        data-email={BuyerListData.email}
                        data-contact={BuyerListData.contact_number}
                        data-bid={BuyerListData.tbl_biddingprice_fk}
                        data-id={BuyerListData.user_fk}
                        />
                }
                <Button className='p-button-danger me-2 p-button-sm' label='Remove List' data-user={BuyerListData.id} onClick={RemoveList} data-id={BuyerListData.user_fk} data-comment={BuyerListData.comment} />
            </>
        )
    }
    // console.log(ProductDetailsInfo);

    const TransactionModal = (e) => {
        setVisible(true)
        setWinner({
            name: e.currentTarget.getAttribute('data-name'),
            email: e.currentTarget.getAttribute('data-email'),
            contact: e.currentTarget.getAttribute('data-contact'),
            offer: e.currentTarget.getAttribute('data-bid'),
            id: e.currentTarget.getAttribute('data-id'), 
        })
    }

    const ModalSchedule = (e) => {
        setuser(e.currentTarget.getAttribute('data-user'))
        setComment(e.currentTarget.getAttribute('data-comment'))
        setuserfk(e.currentTarget.getAttribute('data-id'))
        setBuyerSchedule(true)
    }

    const RemoveList = (e) => {

        const data_d ={
            id: e.currentTarget.getAttribute('data-user'),
            product: data,
        }   

        axios.put(`/api/RemoveList`,data_d).then(res => {
            if (res.data.status === 200) {
                getBuyerList();
                getFetchData();
                toast.current.show({ severity: "success", summary: "Data Has Been Removed", detail: "Successfully" });
            }
        }).catch((error) => {
            if (error.response.status === 500) {
                swal("Warning", error.response.statusText, 'warning');
            }
        })
    }

    // console.log();

    const Schedule = (e) => {
        e.preventDefault();
        setSave(true)

        const data_ = {
            text: schedtext,
            seller_fk: localStorage.getItem('auth_id'),
            buyer_fk: userfk,
            product: data,
            id: UserId,
        };

        axios.put(`/api/Schedule`, data_).then(res => {
            if (res.data.status === 200) {
                getBuyerList();
                setBuyerSchedule(false);
                setSave(false)
                toast.current.show({ severity: 'success', summary: "Schedule Set", detail: "Successfully" });
            }
        }).catch((error) => {
            if (error.response.status === 500) {

            }
        })

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
                                    <h6 className='text-dark'>Highest Bid: <Tag className='' severity={'success'} value={BiddingUserWin == null ? '' : BiddingUserWin.name_user} /> - <Tag severity={'success'} value={BiddingUserWin === null ? '0.00' : `₱${BiddingUserWin.tbl_biddingprice_fk.toFixed(2)}`} /></h6>
                                    <div className="col-lg-12 col-md-12 col-sm-12 mb-2">
                                        <DataTable value={BiddingUser} header="Bid User" paginatorLeft paginator rows={10}>
                                            <Column field='name_user' header="Name of Bidder" ></Column>
                                            <Column field='tbl_biddingprice_fk' body={PriceFormat} header="Amount Bid" ></Column>
                                            <Column field='created_at' body={DateFormat} header="DateTime Bid" ></Column>
                                            <Column field='tbl_biddingprice_fk' body={ButtonActions} header="Actions" ></Column>
                                        </DataTable>
                                    </div>
                                    <div className="mt-3 d-flex justify-content-end">
                                        {

                                        }
                                        <Button onClick={EndBidProduct} disabled={ProductDetailsInfo.price_status === 1 ? true : false} className='p-button-sm p-button-info' label='Show List Buyer' icon={PrimeIcons.USERS} />
                                    </div>

                                </>
                        }
                    </div>
                </div>
            </div>
            <Dialog header="Product Details" onHide={transactionhide} style={{ width: '50vw' }} breakpoints={{ '960px': '75vw', '641px': '100vw' }} visible={visible} position='top' draggable={false}>
                <form onSubmit={CloseBid}>
                    {/* <div className="container"> */}
                    <ul className="list-group">
                        <li className="bg-transparent mb-2 list-group-item d-flex justify-content-between align-items-center border-0">
                            <span className='text-dark'>Product Name: </span>
                            <span className='text-dark'>{ProductDetailsInfo.name}</span>
                        </li>
                        <li className="bg-transparent mb-2 list-group-item d-flex justify-content-between align-items-center border-0">
                            <span className='text-dark'>Product Price: </span>
                            <span className='text-dark'>₱{ProductDetailsInfo.product_price}</span>
                        </li>
                        <li className="bg-transparent mb-2 list-group-item d-flex justify-content-between align-items-center border-0">
                            <span className='text-dark'>Product Address: </span>
                            <span className='text-dark'>{ProductDetailsInfo.address}</span>
                        </li>
                        <Divider>
                            <span className='p-tag'>Bid Winner</span>
                        </Divider>

                        <li className="bg-transparent mb-2 list-group-item d-flex justify-content-between align-items-center border-0">
                            <span className='text-dark'>Bid Winner: </span>
                            <span className='text-dark'>{WinnerBid.name}</span>
                        </li>
                        <li className="bg-transparent mb-2 list-group-item d-flex justify-content-between align-items-center border-0">
                            <span className='text-dark'>Email Address: </span>
                            <span className='text-dark'>{WinnerBid.email}</span>
                        </li>
                        <li className="bg-transparent mb-2 list-group-item d-flex justify-content-between align-items-center border-0">
                                <span className='text-dark'>Contact Number: </span>
                                <span className='text-dark'>{WinnerBid.contact}</span>
                            </li>
                        <li className="bg-transparent mb-2 list-group-item d-flex justify-content-between align-items-center border-0">
                            <span className='text-dark'>Bid Offer: </span>
                            <span className='text-dark'>₱{ WinnerBid.offer} / {ProductDetailsInfo.price_unit === 2 ? "Per Pieces" : 'Per Kilo'}</span>
                        </li>

                        <li className="bg-transparent mb-2 list-group-item d-flex justify-content-between align-items-center border-0">
                            <span className='text-dark'>{ProductDetailsInfo.price_unit === 2 ? "Quantity" : "Total Kilo"} </span>
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
                            <span className='text-dark'>Total Amount - <Badge value={'Starting Price'} /> </span>
                            <span className='text-dark totalamount'>₱{(ProductDetailsInfo.product_price * total).toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ",")}</span>
                        </li>
                        <li className="bg-transparent mb-2 list-group-item d-flex justify-content-between align-items-center border-0">
                            <span className='text-dark'>Total Amount -  <Badge value={'Bid Offer'} /> </span>
                            <span className='text-dark totalamount'>₱{(WinnerBid.offer * total).toFixed(2).replace(/\B(?=(\d{3})+(?!\d))/g, ",")}</span>
                        </li>
                        <Divider></Divider>
                        <div className="mt-3 d-flex justify-content-end">
                            <Button
                                className='p-button-sm p-button-danger'
                                loading={btnloading}
                                label='Close Bid'
                                onClick={GetInfo}
                                disabled={BiddingUserWin === null ? true : false}
                                data-uniq={ProductDetailsInfo.uniq_key}
                                data-user_id={WinnerBid.id}
                                data-total={(WinnerBid.offer * total).toFixed(2)}
                                data-starting={(ProductDetailsInfo.product_price * total).toFixed(2)}
                                data-price_unit={ProductDetailsInfo.price_unit}
                            />
                        </div>
                    </ul>
                    {/* </div> */}
                </form>
            </Dialog>

            <Dialog visible={BuyerModulemodal} header="Buyer List" onHide={onhide} style={{ width: '90vw' }} breakpoints={{ '960px': '75vw', '641px': '100vw' }} position='top' draggable={false}>

                {
                    BuyerListDataloading ? <Skeleton /> :
                        <>
                            <DataTable value={BuyerListData} rows={8} paginator paginatorLeft>
                                <Column field='name_user' header="Buyer Name"></Column>
                                <Column field='email' header="Email"></Column>
                                <Column field='contact_number' header="Contact"></Column>
                                <Column field='tbl_biddingprice_fk' body={PriceFormat} header="Bid Offer"></Column>
                                <Column field='comment' header="Comment"></Column>
                                <Column field='schedule' header="Schedule"></Column>
                                <Column field='id' body={ActionButton} header="Actions"></Column>
                            </DataTable>

                            <div className="mt-3 d-flex justify-content-end">
                                {/* <Button className='p-button-info p-button-sm' onClick={CloseBidModal} label='End' /> */}
                            </div>
                        </>

                }

            </Dialog>



            <Dialog visible={ScheduleModal} header="Details" onHide={hidebuyermodal} style={{ width: '50vw' }} breakpoints={{ '960px': '75vw', '641px': '100vw' }} position='top' draggable={false}>
                <form onSubmit={Schedule} id='sched'>
                    <div className="container">
                        <div className="row">
                            <div className="col-lg-12 col-sm-12 mb-3">
                                <label htmlFor="" className="form-label">
                                    Comment From Buyer
                                </label>
                                <InputTextarea className='w-100' value={comment} readOnly rows={5} cols={5} style={{ resize: 'none' }} placeholder='...' />
                            </div>
                            <div className="col-lg-12 col-sm-12 mb-3">
                                <label htmlFor="" className="form-label">
                                    Remark
                                </label>
                                <InputTextarea className='w-100' name='text' rows={5} cols={5} onChange={(e) => setText(e.target.value)} style={{ resize: 'none' }} placeholder='...' />
                            </div>
                        </div>
                        <div className="mt-3 d-flex justify-content-end">
                            <Button className='p-button-success p-button-sm' loading={saveshed} label='Submit' icon={PrimeIcons.CALENDAR} />
                        </div>
                    </div>
                </form>
            </Dialog>

        </div>
    )
}

export default ProductDetails